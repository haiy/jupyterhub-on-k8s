flst=`ls *.sh`
echo "## k8s cmds info" > k8s_cmd.md
echo "================" >> k8s_cmd.md
for f in $flst;do
    echo ""###" $f   " >> k8s_cmd.md
    cat $f >> k8s_cmd.md
done
