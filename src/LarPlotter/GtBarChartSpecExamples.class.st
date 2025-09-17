Class {
	#name : #GtBarChartSpecExamples,
	#superclass : #Object,
	#category : #'LarPlotter-Examples'
}

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
