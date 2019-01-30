Class {
	#name : #LeReLeak,
	#superclass : #Object,
	#instVars : [
		'type',
		'bytes',
		'objects',
		'frames'
	],
	#category : #LeakReporter
}

{ #category : #accessing }
LeReLeak >> bytes [
	^ bytes
]

{ #category : #accessing }
LeReLeak >> bytes: anObject [
	bytes := anObject
]

{ #category : #accessing }
LeReLeak >> frames [
	^ frames
]

{ #category : #accessing }
LeReLeak >> frames: anObject [
	frames := anObject
]

{ #category : #accessing }
LeReLeak >> objects [
	^ objects
]

{ #category : #accessing }
LeReLeak >> objects: anObject [
	objects := anObject
]

{ #category : #printing }
LeReLeak >> printOn: aStream [
	aStream << type << ' leak of ' << bytes asString << ' bytes in '
		<< objects asString << ' objects' << String lf.
	frames
		do: [ :e | 
			aStream << '  '.
			e printOn: aStream.
			aStream << String lf ]
]

{ #category : #accessing }
LeReLeak >> type [
	^ type
]

{ #category : #accessing }
LeReLeak >> type: anObject [
	type := anObject
]
