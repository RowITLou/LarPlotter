Class {
	#name : 'GtScatterChartSpec',
	#superclass : 'Object',
	#instVars : [
		'json',
		'template'
	],
	#category : 'LarPlotter-Spec',
	#package : 'LarPlotter',
	#tag : 'Spec'
}

{ #category : 'as yet unclassified' }
GtScatterChartSpec >> asJsonString [
	^ STONJSON toStringPretty: self json
]

{ #category : 'as yet unclassified' }
GtScatterChartSpec >> beScatterChart [
	self template: self scatterChartTemplateString
]

{ #category : 'as yet unclassified' }
GtScatterChartSpec >> color [
	^ self encoding at: 'color'
]

{ #category : 'as yet unclassified' }
GtScatterChartSpec >> colorScale: aColorScale [
	^ self color at: 'scale' put: aColorScale
]

{ #category : 'as yet unclassified' }
GtScatterChartSpec >> description [
	^ self json at: 'description'
]

{ #category : 'as yet unclassified' }
GtScatterChartSpec >> description: aText [
	^ self json at: 'description' put: aText
]

{ #category : 'as yet unclassified' }
GtScatterChartSpec >> encoding [
	^ self json at: 'encoding'
]

{ #category : 'as yet unclassified' }
GtScatterChartSpec >> fields: aFieldsArray [
	self assert: aFieldsArray isArray.
	self assert: aFieldsArray size equals: 2.
	self x at: 'field' put: aFieldsArray first.
	self y at: 'field' put: aFieldsArray second
]

{ #category : 'as yet unclassified' }
GtScatterChartSpec >> gtChartSendPoint [
	^ self json at: 'gtChartSendObject'
]

{ #category : 'as yet unclassified' }
GtScatterChartSpec >> gtChartSendPoint: specMethod [
	self json
		at: 'gtChartSendObject'
		put: {'class' -> specMethod methodClass name.
				'selector' -> specMethod selector asString} asDictionary.
	^ self json
]

{ #category : 'as yet unclassified' }
GtScatterChartSpec >> gtJsonObjectFor: aView [
	<gtView>
	^ aView forward
		title: 'JSON object';
		priority: 10;
		object: [ self json asGtJson ];
		view: #gtJsonObjectFor:context:
]

{ #category : 'as yet unclassified' }
GtScatterChartSpec >> gtJsonStringFor: aView [
	<gtView>
	^ aView forward
		title: 'JSON string';
		priority: 20;
		object: [ self json asGtJson ];
		view: #gtJsonStringFor:;
		actionUpdateButton
]

{ #category : 'as yet unclassified' }
GtScatterChartSpec >> initialize [
	self beScatterChart
]

{ #category : 'as yet unclassified' }
GtScatterChartSpec >> json [
	^ json ifNil: [ json := STONJSON fromString: self template ]
]

{ #category : 'as yet unclassified' }
GtScatterChartSpec >> labelAngle [
	^ self xAxis at: 'labelAngle'
]

{ #category : 'as yet unclassified' }
GtScatterChartSpec >> labelAngle: aNumber [
	self assert: aNumber isNumber.
	self assert: aNumber <= 360.
	self assert: aNumber >= -360.
	self xAxis at: 'labelAngle' put: aNumber
]

{ #category : 'as yet unclassified' }
GtScatterChartSpec >> object: field [
(self encoding at: 'object') at: 'field' put: field. 
]

{ #category : 'as yet unclassified' }
GtScatterChartSpec >> scatterChartTemplateString [
	"Basic template for a bar chart with data and fields to be rewritten."
	^ '{
	"description" : "A template for a simple bar chart with embedded data.",
	"mark" : "point",
	"encoding" : {
		"x" : {
			"axis" : {
				"labelAngle" : 45
			},
			"field" : "xFieldName",
			"type" : "quantitative"
		},
		"y" : {
			"field" : "yFieldName",
			"type" : "quantitative"
		},
		"object" : {
			
		}
	},
	"$schema" : "https://vega.github.io/schema/vega-lite/v5.json",
	"data" : {
		"values" : [ ]
	}
}'
]

{ #category : 'as yet unclassified' }
GtScatterChartSpec >> stackedFields: aFieldsArray [
	self assert: aFieldsArray isArray.
	self assert: aFieldsArray size equals: 2.
	self x at: 'field' put: aFieldsArray first.
	self color at: 'field' put: aFieldsArray second
]

{ #category : 'as yet unclassified' }
GtScatterChartSpec >> template [
	^ template
]

{ #category : 'as yet unclassified' }
GtScatterChartSpec >> template: aJsonTemplateString [
	template := aJsonTemplateString.
	json := nil
]

{ #category : 'as yet unclassified' }
GtScatterChartSpec >> values [
	^ (self json at: 'data') at: 'values'
]

{ #category : 'as yet unclassified' }
GtScatterChartSpec >> values: aValuesArray [
	self assert: aValuesArray isArray.
	self assert: aValuesArray isNotEmpty.
	self assert: aValuesArray first isDictionary.
	"self assert: aValuesArray first size equals: 2."
	(self json at: 'data') at: 'values' put: aValuesArray
]

{ #category : 'as yet unclassified' }
GtScatterChartSpec >> values: aValuesArray andFields: aFieldsArray [
	self
		deprecated: 'Send values: and fields: or stackedFields: seperately as cascaded messages.'.
	self
		values: aValuesArray;
		fields: aFieldsArray
]

{ #category : 'as yet unclassified' }
GtScatterChartSpec >> x [
	^ self encoding at: 'x'
]

{ #category : 'as yet unclassified' }
GtScatterChartSpec >> xAxis [
	^ self x at: 'axis'
]

{ #category : 'as yet unclassified' }
GtScatterChartSpec >> xTitle: aTitle [
	^ self x at: 'title' put: aTitle
]

{ #category : 'as yet unclassified' }
GtScatterChartSpec >> y [
	^ self encoding at: 'y'
]

{ #category : 'as yet unclassified' }
GtScatterChartSpec >> yTitle: aTitle [
	^ self y at: 'title' put: aTitle
]
