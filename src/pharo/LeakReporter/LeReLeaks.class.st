Class {
	#name : #LeReLeaks,
	#superclass : #Object,
	#instVars : [
		'leaks'
	],
	#category : #LeakReporter
}

{ #category : #accessing }
LeReLeaks >> componentColors [
	| components factor |
	components := self components.
	factor := 255 * 1.0 / components size.
	^ (components
		withIndexCollect: [ :e :i | e -> (Color h: factor * i s: 1 v: 1) ])
		asDictionary
]

{ #category : #accessing }
LeReLeaks >> components [
	^ ((leaks flatCollect: #frames) asSet
		collect: [ :e | e location component ]) asSet asOrderedCollection
		sorted
]

{ #category : #'as yet unclassified' }
LeReLeaks >> frameConnections [
	| frameLeaks |
	frameLeaks := self frameLeaks.
	^ (frameLeaks associations
		collect: [ :e | 
			| connections |
			connections := (e value
				collect: [ :f | 
					| i previous next |
					i := f frames indexOf: e key.
					previous := f frames at: i - 1 ifAbsent: nil.
					next := f frames at: i + 1 ifAbsent: nil.
					{previous.
					next.
					f bytes.
					f objects} ])
				inject:
					(OrderedCollection
						with: Set new
						with: Set new
						with: 0
						with: 0)
				into: [ :f :g | 
					(g at: 1) ifNotNil: [ :h | (f at: 1) add: h ].
					(g at: 2) ifNotNil: [ :h | (f at: 2) add: h ].
					f at: 3 put: (f at: 3) + (g at: 3).
					f at: 4 put: (f at: 4) + (g at: 4).
					f ].
			e -> connections ]) asDictionary
]

{ #category : #'as yet unclassified' }
LeReLeaks >> frameLeaks [
	^ (self frames
		collect: [ :e | e -> (leaks select: [ :f | f frames includes: e ]) ])
		asDictionary
]

{ #category : #'as yet unclassified' }
LeReLeaks >> frames [
	^ (leaks flatCollect: #frames) asSet
]

{ #category : #'as yet unclassified' }
LeReLeaks >> gtViewFor: aView [
	<gtView>
	^ aView mondrian
		title: 'Leaks' translated;
		priority: 50;
		painting: [ :e | 
			| frameConnections componentColors framesConnectionsIndex maxBytes maxObjects |
			frameConnections := self frameConnections.
			componentColors := self componentColors.
			framesConnectionsIndex := (self frameConnections keys
				collect: [ :f | f key -> f ]) asDictionary.
			maxBytes := (frameConnections values collect: [ :f | f at: 3 ]) max.
			maxObjects := (frameConnections values collect: [ :f | f at: 3 ]) max.
			e nodes
				stencil: [ :f | 
					| connections bytes objects weight |
					connections := frameConnections at: f.
					bytes := connections at: 3.
					objects := connections at: 4.
					weight := bytes / maxBytes.
					BlElement new
						geometry: BlCircle new;
						background:
							((componentColors at: f key location component)
								alpha: 0.5 + (0.5 * weight));
						constraintsDo: [ :c | 
							c horizontal exact: 16 + (32 * weight).
							c vertical exact: 16 + (32 * weight) ];
						yourself ];
				with: frameConnections keys.
			e edges
				fromCenterBottom;
				toCenterTop;
				connectFromAll: [ :f | 
					((frameConnections at: f) value at: 1)
						collect: [ :g | framesConnectionsIndex at: g ] ];
				connectToAll: [ :f | 
					((frameConnections at: f) value at: 2)
						collect: [ :g | framesConnectionsIndex at: g ] ].
			e layout tree ];
		yourself
]

{ #category : #accessing }
LeReLeaks >> leaks [
	^ leaks
]

{ #category : #accessing }
LeReLeaks >> leaks: anObject [
	leaks := anObject
]
