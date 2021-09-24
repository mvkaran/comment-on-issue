# Comment on Issue - GitHub Action

When a comment is added to an Issue containing a specific label, this GitHub Actions checks whether all the assignees on the Issue have also commented or not and adds a specific comment if all assignees have commented.

## Usage

```yml
- uses: mvkaran/comment-on-issue@v1.0
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
    LABEL: 'bug'
    COMMENT: 'Comment text you want to add'
```

## Environment variables to be set

#### `GITHUB_TOKEN`

Your `GITHUB_TOKEN` or any other token that you want the Action to act on behalf of.

#### `LABEL`

A comment on an Issue is qualified only if the Issue also has this label.  

#### `COMMENT`

What comment you want the Action to add, when all assignees have commented on the Issue


## Contributing

Contributions are welcome! Feel free to create an Issue or a Pull Request if you come across a bug or have suggestions on improvements. 

## License

This GitHub Action is licensed under MIT License. For the full text, see the License file in this repository.
