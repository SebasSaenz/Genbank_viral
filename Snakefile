rule targets:
    input:
        "rawdata/genomes_data.tsv",
        "rawdata/clean_genomes_data.tsv",
        "_site/index.html"

rule get_data:
    input:
        script = "code/get_data.sh"
    output:
        "rawdata/genomes_data.tsv"
    params:
       file = "1Mar2024_data.tsv.gz"
    shell:
        """
        {input.script} {params.file}
        """

rule clean_data:
    input:
        r_script = "code/clean_data.R",
        data = "rawdata/genomes_data.tsv"
    output:
        "rawdata/clean_genomes_data.tsv"
    shell:
        """
        {input.r_script}
        """

rule render_website:
    input:
        qmd = "index.qmd",
        data = "rawdata/clean_genomes_data.tsv"
    output:
        "_site/index.html"
    shell:
        """
        quarto render
        """