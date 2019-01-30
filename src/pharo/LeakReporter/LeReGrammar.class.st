Class {
	#name : #LeReGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'leakType',
		'integer',
		'leak',
		'stack',
		'word',
		'frame',
		'leaks',
		'unknownMethod',
		'knownMethod',
		'method',
		'binaryLocation',
		'sourceLocation',
		'location'
	],
	#category : #LeakReporter
}

{ #category : #'as yet unclassified' }
LeReGrammar >> binaryLocation [
	^ ('(' asPParser , #any asPParser starLazy flatten , ':' asPParser
		, #any asPParser starLazy , '+' asPParser
		, #any asPParser starLazy flatten , ')' asPParser)
		==> [ :e | 
			LeReBinaryLocation new
				module: (e at: 2);
				address: (e at: 6);
				yourself ]
]

{ #category : #'as yet unclassified' }
LeReGrammar >> frame [
	^ ('    ' asPParser , word , ' ' asPParser , word , ' ' asPParser
		, method , #newline asPParser) ==> [ :e | e at: 6 ]
]

{ #category : #'as yet unclassified' }
LeReGrammar >> integer [
	^ #digit asPParser plus flatten ==> #asInteger
]

{ #category : #'as yet unclassified' }
LeReGrammar >> knownMethod [
	^ ('in ' asPParser , #any asPParser starLazy flatten , ' ' asPParser
		, location)
		==> [ :e | 
			LeReKnownMethod new
				signature: (e at: 2);
				location: (e at: 4);
				yourself ]
]

{ #category : #'as yet unclassified' }
LeReGrammar >> leak [
	^ (leakType , ' leak of ' asPParser , integer
		, ' byte(s) in ' asPParser , integer
		, ' object(s) allocated from:' asPParser , #newline asPParser
		, stack)
		==> [ :e | 
			LeReLeak new
				type: (e at: 1);
				bytes: (e at: 3);
				objects: (e at: 5);
				stack: (e at: 8);
				yourself ]
]

{ #category : #'as yet unclassified' }
LeReGrammar >> leakType [
	^ ('Indirect' asPParser ==> [ :e | #indirect ]) / ('Direct' asPParser ==> [ :e | #direct ])
]

{ #category : #'as yet unclassified' }
LeReGrammar >> leaks [
	^ ((leak , #newline asPParser star) ==> #first) plus
]

{ #category : #'as yet unclassified' }
LeReGrammar >> location [
	^ binaryLocation / sourceLocation
]

{ #category : #'as yet unclassified' }
LeReGrammar >> method [
	^ unknownMethod / knownMethod
]

{ #category : #'as yet unclassified' }
LeReGrammar >> sourceLocation [
	^ (#any asPParser starLazy flatten , ':' asPParser
		, #any asPParser starLazy flatten)
		==> [ :e | 
			LeReSourceLocation new
				file: (e at: 1);
				line: (e at: 3) asInteger;
				yourself ]
]

{ #category : #'as yet unclassified' }
LeReGrammar >> stack [
	^ frame plus
]

{ #category : #accessing }
LeReGrammar >> start [
	^ leaks
]

{ #category : #'as yet unclassified' }
LeReGrammar >> unknownMethod [
	^ ' (<unknown module>)' asPParser ==> [ :e | LeReUnknownMethod new ]
]

{ #category : #'as yet unclassified' }
LeReGrammar >> word [
	^ #any asPParser starLazy flatten
]
