Class {
	#name : #LeReUnknownFrame,
	#superclass : #LeReFrame,
	#category : #LeakReporter
}

{ #category : #comparing }
LeReUnknownFrame >> = anObject [
	^ self class = anObject class
]

{ #category : #comparing }
LeReUnknownFrame >> hash [
	^ #unknown hash
]

{ #category : #accessing }
LeReUnknownFrame >> location [
	^ LeReUnknownLocation new
]

{ #category : #printing }
LeReUnknownFrame >> printOn: aStream [
	aStream << 'unknown'
]
