if [[ $(git show --no-patch --format="%P" $GITHUB_SHA | wc -w) == "2" ]]; then
  echo "is_merge_commit=true" >> $GITHUB_OUTPUT
else
  echo "is_merge_commit=false" >> $GITHUB_OUTPUT
fi
