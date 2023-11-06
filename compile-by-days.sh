echo "持续集成"

HOMEDIR="/c/workspace"

cd ${HOMEDIR}
arr=("crm-common" "crm-ui" "crm-foundation" "spm-jme" "SPM" "wl-contract" "spm-ui" "crm-opportunity" "abnormal-dispatcher")

echo $arr

for var in ${arr[@]}
do
   cd ${var}
   pwd
   if [ -f "pom.xml" ]; then
	  echo "maven 工程"
	  git pull
	  mvn clean install -DskipTests > /e/export/`date +%Y-%m-%d-%H-%M-%S`
   else
	  echo 'nodejs 工程'
	  git pull
	  npm install > /e/export/`date +%Y-%m-%d-%H-%M-%S`
   fi
   date
   cd ${HOMEDIR}
   touch `date +%Y-%m-%d-%H-%M-%S` 
   sleep $((RANDOM % 30))m
done