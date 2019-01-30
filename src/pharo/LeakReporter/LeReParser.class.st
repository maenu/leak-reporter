Class {
	#name : #LeReParser,
	#superclass : #Object,
	#category : #LeakReporter
}

{ #category : #accessing }
LeReParser >> leak: aStream [
	| words |
	words := self words: aStream nextLine.
	^ LeReLeak new
		type:
			(words first = 'Direct'
				ifTrue: [ #direct ]
				ifFalse: [ #indirect ]);
		bytes: (words at: 4) asInteger;
		objects: (words at: 7) asInteger;
		stack: (self stack: aStream);
		yourself
]

{ #category : #accessing }
LeReParser >> leaks: aStream [
	| leaks |
	leaks := OrderedCollection new.
	[ aStream atEnd ]
		whileFalse: [ leaks add: (self leak: aStream).
			aStream nextLine ].
	^ leaks
]

{ #category : #accessing }
LeReParser >> location: aString [
	| words |
	(aString beginsWith: #'(')
		ifTrue: [ words := ':' split: (aString copyFrom: 2 to: aString size - 1).
			^ LeReBinaryLocation new
				module: words first;
				address: ('+' split: words last) last;
				yourself ].
	words := ':' split: aString.
	^ LeReSourceLocation new
		file: words first;
		line: words last asInteger;
		yourself
]

{ #category : #accessing }
LeReParser >> method: aStream [
	| words location |
	words := self words: aStream nextLine trimBoth.
	location := words removeLast.
	location = '(<unknown module>)'
		ifTrue: [ ^ LeReUnknownMethod new ].
	words
		removeFirst;
		removeFirst;
		removeFirst.
	^ LeReKnownMethod new
		signature: (' ' join: words);
		location: (self location: location);
		yourself
]

{ #category : #accessing }
LeReParser >> stack: aStream [
	| methods |
	methods := OrderedCollection new.
	[ aStream atEnd ]
		whileFalse: [ (aStream peek = Character lf or: [ aStream peek = Character cr ])
				ifTrue: [ ^ methods ].
			methods add: (self method: aStream) ].
	^ methods
]

{ #category : #accessing }
LeReParser >> words: aString [
	^ ' ' split: aString
]
