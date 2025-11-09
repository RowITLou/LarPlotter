Class {
	#name : #GtScatterChartSpecExamples,
	#superclass : #Object,
	#category : #'LarPlotter-Examples'
}

{ #category : #'as yet unclassified' }
GtScatterChartSpecExamples >> CorrelatingMethodSizeSndCommits [
	<gtExample>
	| scatterChart jsonFile jsonFromFile |
	jsonFile := FileLocator gtResource / 'RowITLou' / 'LarPlotter' / 'data'
			/ 'larMethodCommits.json'.
	jsonFromFile := jsonFile readStreamDo: [ :aStream | STON fromStream: aStream ].

	scatterChart := GtScatterChartSpec new
			description: 'Correlating method size and commits.';
			values: jsonFromFile;
			fields: {'size'.
					'commits'};
			object: 'methodName';
			xTitle: 'Size Method';
			yTitle: 'Size Commit ';
			labelAngle: -45;
			yourself.
	self assert: scatterChart labelAngle equals: -45.

	^ scatterChart
]

{ #category : #'as yet unclassified' }
GtScatterChartSpecExamples >> CorrelatingMethodSizeSndCommitsObject [
<gtExample>
	| scatterChart |
	scatterChart := self CorrelatingMethodSizeSndCommits
			gtChartSendPoint: GtScatterChartSpecExamples >> #getMethod:;
			yourself.
			^scatterChart
]

{ #category : #'as yet unclassified' }
GtScatterChartSpecExamples >> gertPageFromDatabase: pageName [
	"An example of a dedicated method to define from the bar and stacked element the object to send to."

	<gtChartSend>
	
	^LeDatabase gtBook pageNamed: pageName.
]

{ #category : #'as yet unclassified' }
GtScatterChartSpecExamples >> getMethod: d [
<gtChartSend>
	| methodParts |
	methodParts := '>>#' split: d.
	methodParts first asClass >> methodParts second asSymbol
]

{ #category : #'as yet unclassified' }
GtScatterChartSpecExamples >> gtBookPagesByKindBarChart [
	<gtExample>
	|  scatterChart |
	scatterChart := GtScatterChartSpec new
			description: 'GT Book pages by kind.';
			values: (LeDatabase gtBook pages
					collect: [ :p | 
						{'pageTitle' -> p title.
							'textSnippets' -> (p allChildrenBreadthFirst select: #isTextSnippet) size.
							'codeSnippets' -> (p allChildrenBreadthFirst select: #isCodeSnippet) size}
							asDictionary ]) asArray;
		fields: {'textSnippets'.
				'codeSnippets'};
		object: 'pageTitle';
		xTitle: 'Text snippet size';
		yTitle: 'Code snippet size';
		labelAngle: -45;
		yourself.
	self assert: scatterChart labelAngle equals: -45.
	
	^ scatterChart
]

{ #category : #'as yet unclassified' }
GtScatterChartSpecExamples >> gtPagesFromDatabase [
<gtExample>
	| scatterChart |
	scatterChart := self gtBookPagesByKindBarChart
			gtChartSendPoint: GtScatterChartSpecExamples >> #gertPageFromDatabase:;
			yourself.
			^scatterChart
]
