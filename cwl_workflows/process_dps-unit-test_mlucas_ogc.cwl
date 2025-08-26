cwlVersion: v1.2
$graph:
- class: Workflow
  label: dps-unit-test-mlucas
  doc: DPS Unit test
  id: dps-unit-test-mlucas
  inputs:
    input_file:
      doc: input file
      label: input file
      type: string
      default: input/input_file.txt
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
  baseCommand: dps-unit-test/run-test.sh
  inputs:
    input_file:
      type: string
      inputBinding:
        position: 1
        prefix: --input_file
      default: input/input_file.txt
  outputs:
    outputs_result:
      outputBinding:
        glob: ./output*
      type: Directory
s:author:
- class: s:Person
  s:name: null
s:contributor:
- class: s:Person
  s:name: null
s:citation: https://repo.dit.maap-project.org/root/dps-unit-test.git
s:codeRepository: https://repo.dit.maap-project.org/root/dps-unit-test.git
s:commitHash: ff5d7eb7fdc5f5a68a539f60f4055de63333960c
s:dateCreated: 2025-08-26
s:license: null
s:softwareVersion: 1.0.0
s:version: mlucas_ogc
s:releaseNotes: None
s:keywords: dps
$namespaces:
  s: https://schema.org/
$schemas:
- https://raw.githubusercontent.com/schemaorg/schemaorg/refs/heads/main/data/releases/9.0/schemaorg-current-http.rdf
