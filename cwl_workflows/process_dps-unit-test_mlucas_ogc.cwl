cwlVersion: v1.2
$graph:
- class: Workflow
  label: dps-unit-test
  doc: Unit testing DPS for new cluster setups
  id: dps-unit-test
  inputs:
    input_file:
      doc: Input file
      label: input file
      type: string
  outputs:
    out:
      type: Directory
      outputSource: process/outputs_result
  steps:
    process:
      run: '#main'
      in:
        input_file: input_file
      out:
      - outputs_result
- class: CommandLineTool
  id: main
  requirements:
    DockerRequirement:
      dockerPull: ghcr.io/maap-project/dps-unit-test:mlucas_ogc
    NetworkAccess:
      networkAccess: true
    ResourceRequirement:
      ramMin: 5
      coresMin: 1
      outdirMax: 20
  baseCommand: /app/dps-unit-test/run-test.sh
  inputs:
    input_file:
      type: string
      inputBinding:
        position: 1
        prefix: --input_file
  outputs:
    outputs_result:
      outputBinding:
        glob: ./output*
      type: Directory
s:author:
- class: s:Person
  s:name: mlucas
s:contributor:
- class: s:Person
  s:name: mlucas
s:citation: https://github.com/MAAP-Project/dps-unit-test.git
s:codeRepository: https://github.com/MAAP-Project/dps-unit-test.git
s:commitHash: 1b0ee1505ac5a39f037edabacf41244f30bed1c5
s:dateCreated: 2025-08-26
s:license: https://github.com/MAAP-Project/dps-unit-test/blob/main/LICENSE
s:softwareVersion: 1.0.0
s:version: mlucas_ogc
s:releaseNotes: None
s:keywords: ogc, dps, test
$namespaces:
  s: https://schema.org/
$schemas:
- https://raw.githubusercontent.com/schemaorg/schemaorg/refs/heads/main/data/releases/9.0/schemaorg-current-http.rdf
