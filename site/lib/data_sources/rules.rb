Class.new(Nanoc::DataSource) do
  identifier :rules

  def items
    content = File.read("../docs/RULES.md")
    content = content.sub(/^#.*$/, '')

    # attributes
    attributes = {
      title: 'Règles du jeu',
      markdown: 'gfm',
      extension: 'md',
      toc: true
    }

    # identifier
    identifier = Nanoc::Identifier.new('/rules.md')

    item = new_item(content, attributes, identifier)

    [item]
  end
end
