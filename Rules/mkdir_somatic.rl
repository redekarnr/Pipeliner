rule mkdir_somatic:
        input:  expand("{s}.recal.bam", s=samples),expand("{s}.recal.bam.bai", s=samples)
        output: temp("QC/decoy"),
                mutect2_dir=config['project']['workpath']+"/mutect2_out",
                strelka_dir=config['project']['workpath']+"/strelka_out",
                mutect_dir=config['project']['workpath']+"/mutect_out",
                vardict_dir=config['project']['workpath']+"/vardict_out",
                merged_dir=config['project']['workpath']+"/merged_somatic_variants",
        params: rname="pl:mkdir"
        shell:  "echo \'decoy\' > {output}; mkdir -p strelka_out; mkdir -p strelka_out/oncotator_out; mkdir -p strelka_out/mutsigCV_out; mkdir -p mutect_out; mkdir -p mutect_out/oncotator_out; mkdir -p mutect_out/mutsigCV_out; mkdir -p conpair_out; mkdir -p germline_vcfs; mkdir -p mutect2_out; mkdir -p mutect2_out/oncotator_out; mkdir -p mutect2_out/mutsigCV_out; mkdir -p mutect2_out/chrom_files; mkdir -p manta_out; mkdir -p merged_somatic_variants; mkdir -p merged_somatic_variants/oncotator_out; mkdir -p merged_somatic_variants/mutsigCV_out; mkdir -p vardict_out; mkdir -p vardict_out/oncotator_out; mkdir -p vardict_out/mutsigCV_out"