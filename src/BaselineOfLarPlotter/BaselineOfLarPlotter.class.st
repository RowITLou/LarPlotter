Class {
	#name : #BaselineOfLarPlotter,
	#superclass : #BaselineOf,
	#category : #BaselineOfLarPlotter
}

{ #category : #loading }
BaselineOfLarPlotter class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'LarPlotter' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfLarPlotter >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'LarPlotter'
		]
]
