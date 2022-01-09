require("nvim-web-devicons").setup {
  -- your personnal icons can go here (to override)
  -- DevIcon will be appended to `name`
  -- should be file extention, NOT filetype (smk but not snakemake)
  override = {
    smk = {
      icon = "",
      color = "#3572A5",
      name = "Snakemake"
    },
    Snakefile = {
      icon = "",
      color = "#3572A5",
      name = "Snakemake"
    },
    sbatch = {
      icon = "",
      color = "#89e051",
      name = "sbatch"
    }
  }
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  -- default = true
}
