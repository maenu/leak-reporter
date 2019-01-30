Class {
	#name : #LeReBinaryLocation,
	#superclass : #LeReLocation,
	#instVars : [
		'module',
		'address'
	],
	#category : #LeakReporter
}

{ #category : #accessing }
LeReBinaryLocation >> address [
	^ address
]

{ #category : #accessing }
LeReBinaryLocation >> address: anObject [
	address := anObject
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
