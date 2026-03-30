import test from "node:test";
import assert from "node:assert/strict";
import { sendError, sendSuccess } from "./api-response";

type MockResponse = {
  statusCode?: number;
  payload?: unknown;
  status: (code: number) => MockResponse;
  json: (data: unknown) => MockResponse;
};

const createMockResponse = (): MockResponse => {
  const res: MockResponse = {
    statusCode: undefined,
    payload: undefined,
    status(code: number) {
      this.statusCode = code;
      return this;
    },
    json(data: unknown) {
      this.payload = data;
      return this;
    },
  };
  return res;
};

test("sendSuccess returns standardized success envelope", () => {
  const res = createMockResponse();
  sendSuccess(res as any, { hello: "world" }, 201, { page: 1 });

  assert.equal(res.statusCode, 201);
  assert.deepEqual(res.payload, {
    success: true,
    data: { hello: "world" },
    meta: { page: 1 },
    error: null,
  });
});

test("sendError returns standardized error envelope", () => {
  const res = createMockResponse();
  sendError(res as any, "VALIDATION_ERROR", "Invalid payload", 400, [{ field: "email" }]);

  assert.equal(res.statusCode, 400);
  assert.deepEqual(res.payload, {
    success: false,
    data: null,
    error: {
      code: "VALIDATION_ERROR",
      message: "Invalid payload",
      details: [{ field: "email" }],
    },
  });
});
