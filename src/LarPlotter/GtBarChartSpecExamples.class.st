"
To visualize the examples, go to the `JSON String` view, or send `asJsonString` to an example, and copy-paste the JSON into the [Vega-Lite editor](https://vega.github.io/editor/). 
"
Class {
	#name : 'GtBarChartSpecExamples',
	#superclass : 'Object',
	#category : 'LarPlotter-Examples',
	#package : 'LarPlotter',
	#tag : 'Examples'
}

{ #category : 'examples' }
GtBarChartSpecExamples >> gtBookPagesByKindBarChart [
	<gtExample>
	| barChart |
	barChart := GtBarChartSpec new
			description: 'GT Book pages by kind.';
			values: (self gtBookTopicMap kind2Pages associations
					collect: [ :kv | 
						{'kind' -> kv key.
							'page-count' -> kv value size} asDictionary ]);
			fields: {'kind'.
					'page-count'};
			xTitle: 'Kinds of GT Book pages';
			yTitle: '# Pages of this Kind';
			labelAngle: -45;
			yourself.
	self assert: barChart labelAngle equals: -45.
	self assert: barChart values size <= LeDatabase gtBook topicMap kinds size.
	^ barChart
]

{ #category : 'examples' }
GtBarChartSpecExamples >> gtBookTopicMap [
	<gtExample>
	^ LeDatabase gtBook topicMap
]

{ #category : 'examples' }
GtBarChartSpecExamples >> larPackageClassMethodsBarChart [
	<gtExample>
	| barChart |
	barChart := GtBarChartSpec new
			description: 'LarPlotter package classes by number of methods per class.';
			values: ((#LarPlotter asPackage classes asOrderedCollection sortedAs: #name) asArray
					collect: [ :aClass | 
						{'class' -> aClass name asString.
							'methods' -> aClass realClass methods size} asDictionary ]);
			fields: {'class'.
					'methods'};
			xTitle: 'LarPlotter classes';
			yTitle: '# methods per class';
			labelAngle: -45;
			yourself.
	self assert: barChart labelAngle equals: -45.
	self assert: barChart values size equals: #LarPlotter asPackage classes size.
	^ barChart
]

{ #category : 'accessing' }
GtBarChartSpecExamples >> sendBar: aBarValue andGroup: aGroupValue withSpec: aJson [
<gtExample>
	"An example of how the gtChartSend spec can be interpreted."

	| spec aMethodSelector aClassSymbol |
	spec := aJson at: 'gtChartSendSubobject'.
	aClassSymbol := (spec at: 'class') asSymbol.
	aMethodSelector := (spec at: 'selector') asSymbol.

	self assert: (Smalltalk globals includesKey: aClassSymbol).
	self assert: aMethodSelector isValidSelector.
	self assert: aMethodSelector isKeyword.
	self assert: (aMethodSelector occurrencesOf: $:) equals: 2.
	self
		assert: (aClassSymbol asClass >> aMethodSelector hasPragmaNamed: 'gtChartSend').

	^ aClassSymbol asClass new
		perform: aMethodSelector
		withArguments: {aBarValue.
				aGroupValue}
]

{ #category : 'as yet unclassified' }
GtBarChartSpecExamples >> sendBarAndGroupExample [
	<gtExample>
	| aField aKind aJson result |
	aField := 'Glamorous Toolkit Basics'.
	aKind := 'Introduction'.
	aJson := self stackedGtBookFieldsByKindBarChartWithChartSend json.
	result := self
			sendBar: aField
			andGroup: aKind
			withSpec: aJson.
	self assert: result kind equals: aKind.
	self assert: (result fields includes: aField).
	^ result
]

{ #category : 'as yet unclassified' }
GtBarChartSpecExamples >> sendGtBookField: aField [
	"An example of a dedicated method to define from the bar and stacked element the object to send to."
	<gtChartSend>
	| topicMap |
	topicMap := LeDatabase gtBook topicMap.
	^ (topicMap fieldNodeNamed: aField)
]

{ #category : 'accessing' }
GtBarChartSpecExamples >> sendGtBookField: aField andKind: aKind [
	"An example of a dedicated method to define from the bar and stacked element the object to send to."

	<gtChartSend>
	| topicMap |
	topicMap := LeDatabase gtBook topicMap.
	^ (topicMap fieldNodeNamed: aField) kindNodeNamed: aKind
]

{ #category : 'examples' }
GtBarChartSpecExamples >> stackedGtBookFieldsByKindBarChart [
	<gtExample>
	| barChart tm |
	tm := self gtBookTopicMap.
	barChart := GtBarChartSpec new
			description: 'GT Book fields showing numbers of kinds of pages per field.';
			beStackedBarChart;
			values: (tm fieldNodes
					flatCollect: [ :fn | 
						fn pageNodes
							collect: [ :pn | 
								{'field' -> fn field.
									'page' -> pn page title.
									'kind' -> pn kind} asDictionary ] ]) asArray;
			stackedFields: {'field'.
					'kind'};
			xTitle: 'GT Book Topic Fields';
			yTitle: 'Kinds of pages per field';
			colorScale: {'domain' -> tm kindsStandardOrder.
					'range'
						-> (tm kindsStandardOrder
								collect: [ :k | '#' , (tm kindPalette at: k) asHexString ])}
					asDictionary;
			labelAngle: -45;
			yourself.
	^ barChart
]

{ #category : 'examples' }
GtBarChartSpecExamples >> stackedGtBookFieldsByKindBarChartWithChartSend [
	<gtExample>
	| barChart |
	barChart := self stackedGtBookFieldsByKindBarChart
			gtChartSend: GtBarChartSpecExamples >> #sendGtBookField:andKind:;
			yourself.
	self
		assert: (barChart gtChartSend at: 'class')
		equals: 'GtBarChartSpecExamples'.
	self
		assert: (barChart gtChartSend at: 'selector')
		equals: 'sendGtBookField:andKind:'.
	^ barChart
]

{ #category : 'as yet unclassified' }
GtBarChartSpecExamples >> stackedGtBookFieldsByKindBarChartWithChartSendBar [
	| barChart |
	barChart := self stackedGtBookFieldsByKindBarChartWithChartSend
			gtChartSendBar: GtBarChartSpecExamples >> #sendGtBookField:;
			yourself.
	self
		assert: (barChart gtChartSend at: 'class')
		equals: 'GtBarChartSpecExamples'.
	self
		assert: (barChart gtChartSendBar at: 'selector')
		equals: 'sendGtBookField:'.
	^ barChart
]
