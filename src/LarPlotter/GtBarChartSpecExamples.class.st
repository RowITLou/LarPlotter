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
			values: (LeDatabase gtBook topicMap kind2Pages associations
						collect: [ :kv | 
							{'kind' -> kv key.
								'page-count' -> kv value size} asDictionary ])
				andFields: {'kind'.
						'page-count'};
			labelAngle: -45;
			yourself.
	self assert: barChart labelAngle equals: -45.
	self assert: barChart values size equals: LeDatabase gtBook topicMap kinds size.
	^ barChart
]

{ #category : #examples }
GtBarChartSpecExamples >> larPackageClassMethodsBarChart [
	<gtExample>
	| barChart |
	barChart := GtBarChartSpec new
			values: ((#LarPlotter asPackage classes asOrderedCollection sortedAs: #name) asArray
						collect: [ :aClass | 
							{'class' -> aClass name asString.
								'methods' -> aClass realClass methods size} asDictionary ])
				andFields: {'class'.
						'methods'};
			labelAngle: -45;
			yourself.
	self assert: barChart labelAngle equals: -45.
	self assert: barChart values size equals: #LarPlotter asPackage classes size.
	^ barChart
]
