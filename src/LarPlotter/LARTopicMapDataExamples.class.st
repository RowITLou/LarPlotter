Class {
	#name : 'LARTopicMapDataExamples',
	#superclass : 'Object',
	#category : 'LarPlotter-Data Providers',
	#package : 'LarPlotter',
	#tag : 'Data Providers'
}

{ #category : 'examples' }
LARTopicMapDataExamples >> dataFromFieldsByStyle [
	<gtExample>
	^ self fieldsByStyle collect: [ :d | d at: 'element' ]
]

{ #category : 'examples' }
LARTopicMapDataExamples >> fieldsByStyle [
	<gtExample>
	| topicMap fields json |
	topicMap := self gtBookTopicMap.
	fields := topicMap databaseNode children nodes.
	json := fields
			collect: [ :aField | 
				{'object' -> aField.
					'element'
						-> (topicMap kinds
								collect: [ :aKind | aKind -> (aField pageGroup select: [ :p | p kind = aKind ]) size ])
								asDictionary} asDictionary ].
	^ json
]

{ #category : 'examples' }
LARTopicMapDataExamples >> fieldsByStyleJsonString [
	<gtExample>
	^ STONJSON toStringPretty: self dataFromFieldsByStyle asArray
]

{ #category : 'examples' }
LARTopicMapDataExamples >> gtBookTopicMap [
	<gtExample>
	^ LeDatabase gtBook topicMap
]
