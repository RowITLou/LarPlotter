Class {
	#name : 'LarPlotterSlideshow',
	#superclass : 'PrioritySlideshow',
	#category : 'LarPlotter-Slideshow',
	#package : 'LarPlotter',
	#tag : 'Slideshow'
}

{ #category : 'as yet unclassified' }
LarPlotterSlideshow class >> show [
	"Implement this here just so we can run it directly from the Coder."
	super show
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> slidePriorities [
	"Instead of manually setting priorities, just list the slides in order here."
	<gtExample>
	<noTest>
	^ #(titleSlide:)
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> titleSlide: aSlide [
	<gtSlide> 
	<text: 'A title slide with multiple, centered texts.'>
	^ (aSlide titleWithFooters)
		setPriority;
		titleWithFormat: (self asTitle: 'A Layered Grammar of Graphics for Interactive Graphic Displays');
		subtitleWithFormat: (self asSubtitle: 'A Prove of Concept in Glamorous Toolkit');
		newFooterWithFormat: (self asBigText: 'A Master Thesis by') underline;
		newFooterWithFormat: (self asBigText: 'Lou-Anne Robert')
]

{ #category : 'as yet unclassified' }
LarPlotterSlideshow >> visualization1: aSlide [
	<gtSlide>
	<text: 'Viszualizations are importatnt to get more insight into datasets'>
	^ aSlide textAndElement
		elementWeight: 0.60;
		setPriority;
		newTextWithFormat: (self asText: 'Viszualizations are importatnt to get more insight into datasets');
		element: [ GtFilePictureLiveSlide new
				fileReference: (GtResourcesUtility
						resourceAtPath: self picturesDirectoryPath / 'smalltalk-80.png') ]
]
