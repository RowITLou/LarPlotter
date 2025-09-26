"
To visualize the examples, go to the `JSON String` view, or send `asJsonString` to an example, and copy-paste the JSON into the [Vega-Lite editor](https://vega.github.io/editor/). 
"
Class {
	#name : #GtBarChartSpecExamples,
	#superclass : #Object,
	#category : #'LarPlotter-Examples'
}

{ #category : #examples }
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
	self assert: barChart values size equals: LeDatabase gtBook topicMap kinds size.
	^ barChart
]

{ #category : #examples }
GtBarChartSpecExamples >> gtBookTopicMap [
	<gtExample>
	^ LeDatabase gtBook topicMap
]

{ #category : #examples }
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

{ #category : #examples }
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
									'kind' -> pn kind} asDictionary ] ]);
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
