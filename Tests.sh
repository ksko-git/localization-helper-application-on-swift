
allTests=()
amountTests=6
allRuntimes=0

passedTestsCount=0
failedTestsCount=0

allTests[0]="search"
allTests[1]="search -k day"
allTests[2]="search -l ru"
allTests[3]="search -k day -l ru"
allTests[4]="update hi -k hello -l en"
allTests[5]="delete -k dia -l pt"

for ((i = 0; i < "$amountTests"; i++)); do
  let allRuntimes++
  
  test=${allTests[$i]}
    ./.build/debug/Run ""${test}""
  
  exitCode="$?"
  if [ "$exitCode" == 0 ]; then
    echo "Test $i passed: exit code - $exitCode."
    let passedTestsCount++
  else
    echo "Test $i failed: received - $exitCode expected - $expectedExitCode."
    let failedTestsCount++
  fi
done

echo _____________________________
echo "Tests count =" $allRuntimes
echo "Tests passed =" $passedTestsCount
echo "Tests failed =" $failedTestsCount







