Class {
	#name : #LeReKnownMethod,
	#superclass : #LeReMethod,
	#instVars : [
		'signature',
		'location'
	],
	#category : #LeakReporter
}

{ #category : #accessing }
LeReKnownMethod >> location [
	^ location
]

{ #category : #accessing }
LeReKnownMethod >> location: anObject [
	location := anObject
]

{ #category : #printing }
LeReKnownMethod >> printOn: aStream [
	aStream << 'at ' << signature << ' in '.
	location printOn: aStream
]

{ #category : #accessing }
LeReKnownMethod >> signature [
	^ signature
]

{ #category : #accessing }
LeReKnownMethod >> signature: anObject [
	signature := anObject
]
