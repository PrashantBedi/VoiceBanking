FLAVOR=development
B_TYPE=debug

run/%:
	flutter pub global run melos run $(@F)

app/%:
	cd apps/ui; flutter run -d $(@F) --flavor $(FLAVOR) --$(B_TYPE)

bootstrap:
	flutter pub global run melos bootstrap

list-devices:
	flutter devices

precommit:
	./tools/pre-commit-hooks-setup.sh

integration-test:
	cd apps/ui; flutter test -r expanded --timeout none integration_test/*_test.dart --flavor development
