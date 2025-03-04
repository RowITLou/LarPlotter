Class {
	#name : #LarPlotterHomeSection,
	#superclass : #GtHomeMultiCardSection,
	#category : #'LarPlotter-HomeSection'
}

{ #category : #initialization }
LarPlotterHomeSection >> tocCard [
<gtSectionCard>
	<gtExample>
	^ GtHomeCard page
		title: 'Masters Project';
		description: 'Masters Thesis';
		priority: 10;
		pageName: 'TOC Plotter';
		databaseName: 'RowITLou\LarPlotter\lepiter';
		assertInvariant;
		yourself
]
