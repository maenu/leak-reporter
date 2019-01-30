Class {
	#name : #LeReLeaks,
	#superclass : #Object,
	#instVars : [
		'leaks'
	],
	#category : #LeakReporter
}

{ #category : #accessing }
LeReLeaks >> leaks [
	^ leaks
]

{ #category : #accessing }
LeReLeaks >> leaks: anObject [
	leaks := anObject
]
