"""Console script for zzl_mkdoc_sample."""

import click


@click.command()
def main():
    """Main entrypoint."""
    click.echo("zzl_mkdoc_sample")
    click.echo("=" * len("zzl_mkdoc_sample"))
    click.echo("A mkdoc sample")


if __name__ == "__main__":
    main()  # pragma: no cover
