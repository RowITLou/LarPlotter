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

{ #category : #accessing }
GtBarChartSpec >> color [
	^ self encoding at: 'color'
]

{ #category : #initialization }
GtBarChartSpec >> colorScale: aColorScale [
	^ self color at: 'scale' put: aColorScale
]

{ #category : #accessing }
GtBarChartSpec >> description [
	^ self json at: 'description'
]

{ #category : #initialization }
GtBarChartSpec >> description: aText [
	^ self json at: 'description' put: aText
]

{ #category : #accessing }
GtBarChartSpec >> encoding [
	^ self json at: 'encoding'
]

{ #category : #initialization }
GtBarChartSpec >> fields: aFieldsArray [
	self assert: aFieldsArray isArray.
	self assert: aFieldsArray size equals: 2.
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
	"
	in color: 
	type : nominal,
	"
	^ '{
	"description" : "A template for a simple bar chart with embedded data.",
	"mark" : "bar",
	"encoding" : {
		"color" : {
			"scale" : { },
			"field" : "yFieldName"
			
		},
		"x" : {
			"axis" : {
				"labelAngle" : 45
			},
			"field" : "xFieldName",
			"type" : "nominal"
		},
		"y" : {
			"aggregate" : "count",
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
GtBarChartSpec >> stackedFields: aFieldsArray [
	self assert: aFieldsArray isArray.
	self assert: aFieldsArray size equals: 2.
	self x at: 'field' put: aFieldsArray first.
	self color at: 'field' put: aFieldsArray second
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
		deprecated: 'Send values: and fields: or stackedFields: seperately as cascaded messages.'.
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

{ #category : #initialization }
GtBarChartSpec >> xTitle: aTitle [
	^ self x at: 'title' put: aTitle
]

{ #category : #accessing }
GtBarChartSpec >> y [
	^ self encoding at: 'y'
]

{ #category : #initialization }
GtBarChartSpec >> yTitle: aTitle [
	^ self y at: 'title' put: aTitle
]
