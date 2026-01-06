Class {
	#name : 'LarPlotterHomeSection',
	#superclass : 'GtHomeMultiCardSection',
	#category : 'LarPlotter-HomeSection',
	#package : 'LarPlotter',
	#tag : 'HomeSection'
}

{ #category : 'initialization' }
LarPlotterHomeSection >> defaultPriority [
	^ 20
]

{ #category : 'initialization' }
LarPlotterHomeSection >> sectionTitle [
	^ 'LAR MSc project'
]

{ #category : 'card' }
LarPlotterHomeSection >> tocCard [
<gtSectionCard>
	<gtExample>
	^ GtHomeCard page
		title: 'LAR Masters Project';
		description: 'Masters Thesis';
		priority: 10;
		pageName: 'TOC Plotter';
		databaseName: 'LarPlotterLepiter';
		assertInvariant;
		yourself
]
