{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/openai_utils/model.py',
        ],
      ],
      files: {
        'adgn/src/adgn/openai_utils/model.py': [
          {
            end_line: 405,
            start_line: 401,
          },
          {
            end_line: 345,
            start_line: 345,
          },
          {
            end_line: 379,
            start_line: 376,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The `OpenAIModelProto` protocol (line 401) is defined AFTER its implementations (`OpenAIModel` at line 345 and `BoundOpenAIModel` at line 376). This makes the code harder to understand - readers see implementations before understanding the interface contract.\n\nAdditionally, the implementations don't explicitly inherit from the protocol. While structural typing means they satisfy the protocol, explicit inheritance would:\n1. Make the implementation relationship clear and intentional\n2. Catch errors at definition time if the implementation is incomplete\n3. Make it harder to accidentally create unintended implementations\n\nBetter approach: Convert the protocol to an ABC (Abstract Base Class) and define it ABOVE its implementations. Have implementations explicitly inherit from it:\n\n```python\nfrom abc import ABC, abstractmethod\n\nclass OpenAIModelProto(ABC):\n    @property\n    @abstractmethod\n    def model(self) -> str: ...\n\n    @abstractmethod\n    async def responses_create(self, req: ResponsesRequest) -> ResponsesResult: ...\n\nclass OpenAIModel(OpenAIModelProto):\n    # ... implementation\n\nclass BoundOpenAIModel(OpenAIModelProto):\n    # ... implementation\n```\n\nThis makes the contract explicit, prevents accidental implementations, and improves code organization.\n",
  should_flag: true,
}
