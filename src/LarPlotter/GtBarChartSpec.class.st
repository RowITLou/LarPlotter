"
I can generate a Vega-Lite compatible JSON spec for very simple bar charts.
"
Class {
	#name : #GtBarChartSpec,
	#superclass : #Object,
	#instVars : [
		'json'
	],
	#category : #'LarPlotter-Spec'
}

{ #category : #converting }
GtBarChartSpec >> asJsonString [
	^ STONJSON toStringPretty: self json
]

{ #category : #accessing }
GtBarChartSpec >> barChartTemplate [
	<gtExample>
	^ STONJSON fromString: self barChartTemplateString
]

{ #category : #constants }
GtBarChartSpec >> barChartTemplateString [
	<gtExample>
	^ '{
  "$schema": "https://vega.github.io/schema/vega-lite/v5.json",
  "description": "A template for a simple bar chart with embedded data.",
  "data": {
    "values": [
    ]
  },
  "mark": "bar",
  "encoding": {
    "x": {"field": "a", "type": "nominal", "axis": {"labelAngle": 45}},
    "y": {"field": "b", "type": "quantitative"}
  }
}'
]

{ #category : #views }
GtBarChartSpec >> gtJsonObjectFor: aView [
	<gtView>
	^ aView forward
		title: 'JSON object';
		priority: 10;
		object: [ self json asGtJson ];
		view: #gtJsonObjectFor:context:
]

{ #category : #views }
GtBarChartSpec >> gtJsonStringFor: aView [
	<gtView>
	^ aView forward
		title: 'JSON string';
		priority: 20;
		object: [ self json asGtJson ];
		view: #gtJsonStringFor:;
		actionUpdateButton
]

{ #category : #accessing }
GtBarChartSpec >> json [
	^ json ifNil: [ json := self barChartTemplate ]
]

{ #category : #accessing }
GtBarChartSpec >> labelAngle [
	^ (((self json at: 'encoding') at: 'x') at: 'axis') at: 'labelAngle'
]

{ #category : #initialization }
GtBarChartSpec >> labelAngle: aNumber [
	self assert: aNumber isNumber.
	self assert: aNumber <= 360.
	self assert: aNumber >= -360.
	(((self json at: 'encoding') at: 'x') at: 'axis') at: 'labelAngle' put: aNumber
]

{ #category : #accessing }
GtBarChartSpec >> values [
	^ (self json at: 'data') at: 'values'
]

{ #category : #initialization }
GtBarChartSpec >> values: aValuesArray andFields: aFieldsArray [
	self assert: aValuesArray isArray.
	self assert: aValuesArray isNotEmpty.
	self assert: aValuesArray first isDictionary.
	"self assert: aValuesArray first size equals: 2."
	self assert: aFieldsArray isArray.
	self assert: aFieldsArray size equals: 2.
	"aValuesArray
		do: [ :dict | self assert: dict keys asSet equals: aFieldsArray asSet ]."
	(self json at: 'data') at: 'values' put: aValuesArray.
	((self json at: 'encoding') at: 'x') at: 'field' put: aFieldsArray first.
	((self json at: 'encoding') at: 'y') at: 'field' put: aFieldsArray second
]
