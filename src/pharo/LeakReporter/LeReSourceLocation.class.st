Class {
	#name : #LeReSourceLocation,
	#superclass : #LeReLocation,
	#instVars : [
		'file',
		'line'
	],
	#category : #LeakReporter
}

{ #category : #comparing }
LeReSourceLocation >> = anObject [
	^ anObject class = self class
		and:
			[ file = anObject file and: [ line = anObject line ] ]
]

{ #category : #'as yet unclassified' }
LeReSourceLocation >> component [
	^ file
]

{ #category : #accessing }
LeReSourceLocation >> file [
	^ file
]

{ #category : #accessing }
LeReSourceLocation >> file: anObject [
	file := anObject
]

{ #category : #comparing }
LeReSourceLocation >> hash [
	^ #unknown hash
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
