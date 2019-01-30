Class {
	#name : #LeReKnownFrame,
	#superclass : #LeReFrame,
	#instVars : [
		'signature',
		'location'
	],
	#category : #LeakReporter
}

{ #category : #comparing }
LeReKnownFrame >> = anObject [
	^ anObject class = self class
		and:
			[ signature = anObject signature and: [ location = anObject location ] ]
]

{ #category : #comparing }
LeReKnownFrame >> hash [
	^ signature hash bitXor: location hash
]

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
