Class {
	#name : #LeReExamples,
	#superclass : #Object,
	#category : #LeakReporter
}

{ #category : #accessing }
LeReExamples >> leaks1 [
	<gtExample>
	^ self parse: (self leaks: 1)
]

{ #category : #accessing }
LeReExamples >> leaks2 [
	<gtExample>
	^ self parse: (self leaks: 2)
]

{ #category : #accessing }
LeReExamples >> leaks: anInteger [
	^ self res / ('leaks.' , anInteger asString , '.txt')
]

{ #category : #parsing }
LeReExamples >> parse: aFileReference [
	^ LeReParser new leaks: aFileReference readStream
]

{ #category : #accessing }
LeReExamples >> repository [
	^ IceRepository registry
		detect: [ :e | e includesPackageNamed: self class package name ]
]

{ #category : #accessing }
LeReExamples >> res [
	^ self repository location / #res
]
