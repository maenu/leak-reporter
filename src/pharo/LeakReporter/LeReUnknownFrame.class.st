Class {
	#name : #LeReUnknownFrame,
	#superclass : #LeReFrame,
	#category : #LeakReporter
}

{ #category : #printing }
LeReUnknownFrame >> printOn: aStream [
	aStream << 'unknown'
]
