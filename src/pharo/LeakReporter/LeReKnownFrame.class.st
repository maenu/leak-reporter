Class {
	#name : #LeReKnownFrame,
	#superclass : #LeReFrame,
	#instVars : [
		'signature',
		'location'
	],
	#category : #LeakReporter
}

{ #category : #accessing }
LeReKnownFrame >> location [
	^ location
]

{ #category : #accessing }
LeReKnownFrame >> location: anObject [
	location := anObject
]

{ #category : #printing }
LeReKnownFrame >> printOn: aStream [
	aStream << 'at ' << signature << ' in '.
	location printOn: aStream
]

{ #category : #accessing }
LeReKnownFrame >> signature [
	^ signature
]

{ #category : #accessing }
LeReKnownFrame >> signature: anObject [
	signature := anObject
]
