git clone --depth 1 https://github.com/actions/runner-images/
cd runner-images/images/ubuntu/scripts/build
for i in install-*.sh ; do
name=$(echo $i | sed 's/install-//' | sed 's/.sh//')
echo "  $name:
    description: Remove $name
    required: true
    default: false" >> 1-res
echo "    - name: Remove $name
      if: \${{inputs.$name}}
      run: |" >> 2-res
done