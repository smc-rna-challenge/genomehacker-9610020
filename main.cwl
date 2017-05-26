class: Workflow
cwlVersion: v1.0
dct:creator: {'@id': 'http://orcid.org/0000-0002-7681-6415', 'foaf:mbox': genomehacker@synapse.org,
  'foaf:name': genomehacker}
doc: 'SMC-RNA challenge isoform quantification submission

  GEXPRESS workflow: tar transcriptome index, analyze with GEXPRESS'
hints: []
id: main
inputs:
- {id: TUMOR_FASTQ_1, type: File}
- {id: TUMOR_FASTQ_2, type: File}
- {id: transcriptome_db, type: File}
name: main
outputs:
- {id: OUTPUT, outputSource: gexpress/output, type: File}
requirements:
- {class: InlineJavascriptRequirement}
- {class: ResourceRequirement, coresMin: 8, ramMin: 60000}
steps:
- id: gexpress
  in:
  - {id: fastq1, source: TUMOR_FASTQ_1}
  - {id: fastq2, source: TUMOR_FASTQ_2}
  - {id: gmapdb, source: tar/output}
  - {default: true, id: gunzip}
  - {default: 12, id: nthreads}
  - {default: 100, id: readlength}
  - {default: transcript.splicesites, id: transcript_splicesites}
  - {default: GRCh37.75.transcripts, id: transcriptome_db}
  out: [output]
  run: gexpress.cwl
- id: tar
  in:
  - {id: input, source: transcriptome_db}
  out: [output]
  run: tarz.cwl
