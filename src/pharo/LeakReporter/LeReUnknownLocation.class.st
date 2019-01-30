Class {
	#name : #LeReUnknownLocation,
	#superclass : #LeReLocation,
	#category : #LeakReporter
}

{ #category : #comparing }
LeReUnknownLocation >> = anObject [
	^ self class = anObject class
]

{ #category : #'as yet unclassified' }
LeReUnknownLocation >> component [
	^ #unknown
]

{ #category : #comparing }
LeReUnknownLocation >> hash [
	^ #unknown hash
]
