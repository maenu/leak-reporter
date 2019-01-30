Class {
	#name : #LeReSourceLocation,
	#superclass : #LeReLocation,
	#instVars : [
		'file',
		'line'
	],
	#category : #LeakReporter
}

{ #category : #accessing }
LeReSourceLocation >> file [
	^ file
]

{ #category : #accessing }
LeReSourceLocation >> file: anObject [
	file := anObject
]

{ #category : #accessing }
LeReSourceLocation >> line [
	^ line
]

{ #category : #accessing }
LeReSourceLocation >> line: anObject [
	line := anObject
]

{ #category : #printing }
LeReSourceLocation >> printOn: aStream [
	aStream << file << ':' << line asString
]
