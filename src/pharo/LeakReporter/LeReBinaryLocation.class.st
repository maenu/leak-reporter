Class {
	#name : #LeReBinaryLocation,
	#superclass : #LeReLocation,
	#instVars : [
		'module',
		'address'
	],
	#category : #LeakReporter
}

{ #category : #comparing }
LeReBinaryLocation >> = anObject [
	^ anObject class = self class
		and:
			[ module = anObject module and: [ address = anObject address ] ]
]

{ #category : #accessing }
LeReBinaryLocation >> address [
	^ address
]

{ #category : #accessing }
LeReBinaryLocation >> address: anObject [
	address := anObject
]

{ #category : #'as yet unclassified' }
LeReBinaryLocation >> component [
	^ module
]

{ #category : #comparing }
LeReBinaryLocation >> hash [
	^ module hash bitXor: address hash
]

{ #category : #accessing }
LeReBinaryLocation >> module [
	^ module
]

{ #category : #accessing }
LeReBinaryLocation >> module: anObject [
	module := anObject
]

{ #category : #printing }
LeReBinaryLocation >> printOn: aStream [
	aStream << module << ':' << address
]
