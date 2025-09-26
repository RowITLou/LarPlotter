"
I can generate a Vega-Lite compatible JSON spec for very simple bar charts.
"
Class {
	#name : #GtBarChartSpec,
	#superclass : #Object,
	#instVars : [
		'json',
		'template'
	],
	#category : #'LarPlotter-Spec'
}

{ #category : #converting }
GtBarChartSpec >> asJsonString [
	^ STONJSON toStringPretty: self json
]

{ #category : #constants }
GtBarChartSpec >> barChartTemplateString [
	"Basic template for a bar chart with data and fields to be rewritten."
	^ '{
	"description" : "A template for a simple bar chart with embedded data.",
	"mark" : "bar",
	"encoding" : {
		"x" : {
			"axis" : {
				"labelAngle" : 45
			},
			"field" : "xFieldName",
			"type" : "nominal"
		},
		"y" : {
			"field" : "yFieldName",
			"type" : "quantitative"
		}
	},
	"$schema" : "https://vega.github.io/schema/vega-lite/v5.json",
	"data" : {
		"values" : [ ]
	}
}'
]

{ #category : #initialization }
GtBarChartSpec >> beBarChart [
	self template: self barChartTemplateString
]

{ #category : #initialization }
GtBarChartSpec >> beStackedBarChart [
	self template: self stackedBarChartTemplateString
]

{ #category : #initialization }
GtBarChartSpec >> colorScale: aColorScale [
	^ (self json at: 'color') at: 'scale' put: aColorScale
]

{ #category : #accessing }
GtBarChartSpec >> encoding [
	^ self json at: 'encoding'
]

{ #category : #initialization }
GtBarChartSpec >> fields: aFieldsArray [
	self assert: aFieldsArray isArray.
	self assert: aFieldsArray size equals: 2.	"aValuesArray
		do: [ :dict | self assert: dict keys asSet equals: aFieldsArray asSet ]."
	self x at: 'field' put: aFieldsArray first.
	self y at: 'field' put: aFieldsArray second
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

{ #category : #initialization }
GtBarChartSpec >> initialize [
	self beBarChart
]

{ #category : #accessing }
GtBarChartSpec >> json [
	^ json ifNil: [ json := STONJSON fromString: self template ]
]

{ #category : #accessing }
GtBarChartSpec >> labelAngle [
	^ self xAxis at: 'labelAngle'
]

{ #category : #initialization }
GtBarChartSpec >> labelAngle: aNumber [
	self assert: aNumber isNumber.
	self assert: aNumber <= 360.
	self assert: aNumber >= -360.
	self xAxis at: 'labelAngle' put: aNumber
]

{ #category : #constants }
GtBarChartSpec >> stackedBarChartTemplateString [
	"Basic template for a stacked bar chart with data and fields to be rewritten."
	^ '{
	"description" : "A template for a simple bar chart with embedded data.",
	"mark" : "bar",
	"encoding" : {
		"x" : {
			"axis" : {
				"labelAngle" : 45
			},
			"field" : "xFieldName",
			"type" : "nominal"
		},
		"y" : {
			"type" : "quantitative",
			"aggregate" : "count"
		}
	},
	"$schema" : "https://vega.github.io/schema/vega-lite/v5.json",
	"color" : {
		"scale" : { },
		"field" : "yFieldName",
		"type" : "nominal"
	},
	"data" : {
		"values" : [ ]
	}
}'
]

{ #category : #accessing }
GtBarChartSpec >> template [
	^ template
]

{ #category : #accessing }
GtBarChartSpec >> template: aJsonTemplateString [
	template := aJsonTemplateString.
	json := nil
]

{ #category : #accessing }
GtBarChartSpec >> values [
	^ (self json at: 'data') at: 'values'
]

{ #category : #initialization }
GtBarChartSpec >> values: aValuesArray [
	self assert: aValuesArray isArray.
	self assert: aValuesArray isNotEmpty.
	self assert: aValuesArray first isDictionary.
	"self assert: aValuesArray first size equals: 2."
	(self json at: 'data') at: 'values' put: aValuesArray
]

{ #category : #initialization }
GtBarChartSpec >> values: aValuesArray andFields: aFieldsArray [
	self
		values: aValuesArray;
		fields: aFieldsArray
]

{ #category : #accessing }
GtBarChartSpec >> x [
	^ self encoding at: 'x'
]

{ #category : #accessing }
GtBarChartSpec >> xAxis [
	^ self x at: 'axis'
]

{ #category : #accessing }
GtBarChartSpec >> y [
	^ self encoding at: 'y'
]
