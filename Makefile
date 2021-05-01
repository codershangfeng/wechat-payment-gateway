.PHONY: fmt
fmt:
	go fmt ./...

.PHONY: run
run: fmt
	go run ./cmd/main.go

# Test
.PHONY: clean-test-cache
clean-test-cache:
	go clean -testcache

.PHONY: utest
utest: fmt clean-test-cache
	go test -tags=unit ./...

.PHONY: itest
itest: fmt clean-test-cache
	go test -tags=integration ./...

.PHONY: test
test: fmt clean-test-cache gen 
	go test -tags="integration unit" ./...
