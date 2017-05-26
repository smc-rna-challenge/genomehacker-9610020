arguments:
- {position: 1, prefix: -D, valueFrom: $(inputs.gmapdb)}
- {position: 96, prefix: -o, valueFrom: $(runtime.outdir)}
baseCommand: [gexpress]
class: CommandLineTool
cwlVersion: v1.0
doc: 'GEXPRESS: Analysis'
hints:
- {class: DockerRequirement, dockerPull: 'quay.io/smc-rna-challenge/genomehacker-9610020-gsnap:1.0.0'}
inputs:
- id: fastq1
  inputBinding: {position: 98}
  type: File
- id: fastq2
  inputBinding: {position: 99}
  type: ['null', File]
- {id: gmapdb, type: Directory}
- id: gunzip
  inputBinding: {position: 97, prefix: -g}
  type: boolean
- id: nthreads
  inputBinding: {position: 5, prefix: -t}
  type: int
- id: readlength
  inputBinding: {position: 2, prefix: -L}
  type: int
- id: transcript_splicesites
  inputBinding: {position: 4, prefix: -r}
  type: string
- id: transcriptome_db
  inputBinding: {position: 3, prefix: -d}
  type: string
outputs:
- id: output
  outputBinding: {glob: sample.expr}
  type: File
requirements:
- {class: InlineJavascriptRequirement}
- {class: ResourceRequirement, coresMin: 8, ramMin: 60000}
