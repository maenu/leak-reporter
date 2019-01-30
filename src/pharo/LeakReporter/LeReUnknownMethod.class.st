Class {
	#name : #LeReUnknownMethod,
	#superclass : #LeReMethod,
	#category : #LeakReporter
}

{ #category : #printing }
LeReUnknownMethod >> printOn: aStream [
	aStream << 'unknown'
]
