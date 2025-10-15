"
This is the model class for the bars in a bargraph. When creating a graph the method {{gtMethod:name=LarPlotterBar>>addBars:}} can be called. By adding the values we want to be represented the bars get created automatically in the order the values are in the orderedCollection. see the example here {{gtMethod:name=LarPlotterBarExamples>>addBars}}. 
"
Class {
	#name : #LarBar,
	#superclass : #Object,
	#instVars : [
		'width',
		'height',
		'data',
		'object',
		'value',
		'subbar',
		'color'
	],
	#category : #'LarPlotter-Model'
}

{ #category : #'as yet unclassified' }
LarBar >> asElement [
^LarBarElement new initialize: self.
]

{ #category : #accessing }
LarBar >> color [
	^ color
]

{ #category : #accessing }
LarBar >> color: anObject [
	color := anObject
]

{ #category : #accessing }
LarBar >> data [
	^ data
]

{ #category : #accessing }
LarBar >> data: anObject [
	data := anObject
]

{ #category : #'as yet unclassified' }
LarBar >> gtObjectView: aView [
<gtView>
	^aView forward
		title: 'Object';
		priority: 10;
		object: [ self object];
		view: #gtRawFor:;
		actionUpdateButton.

]

{ #category : #'as yet unclassified' }
LarBar >> gtSubbarView: aView [
<gtView>
 subbar isNil
 ifTrue: [^ (aView textEditor)
		title: 'Print';
		priority: 21;
		aptitude: BrGlamorousCodeEditorAptitude;
		text: [ 'There are no Subbars in this Bar' asRopedText ].]
		
	ifFalse:[^ (aView columnedList)
		title: 'Subbars';
		priority: 20;
		
		items: [ self subbar ];
		column: 'Subbar' text: [ :sub | sub ];
		column: 'Data' text: [ :sub |  sub tooltip];
		column: 'Value' text: [ :sub | sub value ];
		column: 'Object' text: [ :sub | sub object ].]
]

{ #category : #accessing }
LarBar >> height [
	^ height
]

{ #category : #accessing }
LarBar >> height: anObject [
	height := anObject
]

{ #category : #'as yet unclassified' }
LarBar >> initialize: sizeHeight with: sizeWidth [

self height: sizeHeight. 
self width: sizeWidth. 
^self.
]

{ #category : #accessing }
LarBar >> object [
	^ object
]

{ #category : #accessing }
LarBar >> object: anObject [
	object := anObject
]

{ #category : #'as yet unclassified' }
LarBar >> resize: sizeWidth with: sizeHeight [
self sizeWidth: sizeWidth. 
self sizeHeight: sizeHeight.
^self asElement

]

{ #category : #'as yet unclassified' }
LarBar >> setBorderColor: color [
self asElement border: (BlBorder paint: color)
]

{ #category : #accessing }
LarBar >> subbar [
	^ subbar
]

{ #category : #accessing }
LarBar >> subbar: anObject [
	subbar := anObject
]

{ #category : #accessing }
LarBar >> value1 [
	^ value
]

{ #category : #accessing }
LarBar >> value: anObject [
	value := anObject
]

{ #category : #accessing }
LarBar >> width [
	^ width
]

{ #category : #accessing }
LarBar >> width: anObject [
	width := anObject
]
