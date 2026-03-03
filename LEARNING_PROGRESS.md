# MODULAR-RAG-MCP-SERVER 学习进度

## 学习目标

通过对照commit自己实现，深入理解RAG系统的设计与实现。

## 学习进度

### 阶段零：项目初始化与核心基础 (2025年1月27日)

- [ ] `4607eb5` feat(B3): add splitter base + factory
- [ ] `008a00b` feat(B4): implement VectorStore abstract interface and factory
- [ ] `b618489` feat(B5): add base and factory reranker
- [ ] `9aa5d9c` feat(evaluator): [Phase B6] add evaluator abstraction
- [ ] `70b6905` feat(B7.1): implement OpenAI-compatible LLM providers
- [ ] `56d0dc3` feat(B7.2): implement Ollama LLM provider
- [ ] `d87aae6` feat(B7.3): implement OpenAI & Azure Embedding providers
- [ ] `95b4955` feat(B7.4): implement Ollama Embedding provider
- [ ] `26d5792` feat(B7.5): implement RecursiveSplitter with LangChain
- [ ] `e2e3ba2` feat(B7.6): validate ChromaStore implementation
- [ ] `1997b65` feat(B7.7): implement LLM-based reranker
- [ ] `bd15807` feat(B7.8): implement Cross-Encoder Reranker

### 阶段一：数据摄取管道-数据层

- [ ] `354a458` fix(spec): align core data contract with structure
- [ ] `44ab375` feat(C1): implement core data types
- [ ] `d539ae9` fix(spec): clarify C2 file integrity check with SQLite
- [ ] `e99a25c` feat(C2): implement file integrity checker
- [ ] `cf7d733` fix(spec+code): sync C1 multimodal image metadata
- [ ] `22990e4` feat(C3): Implement BaseLoader and PdfLoader

### 阶段二：数据摄取管道-处理层

- [ ] `756b5c0` feat(C4): implement DocumentChunker adapter
- [ ] `02e8532` feat(C5): Implement ChunkRefiner with Rule+LLM
- [ ] `79edb68` feat(C6): implement MetadataEnricher
- [ ] `abdfeb9` Fix(spec): Add Vision LLM architecture
- [ ] `96ce645` feat(B8): add Vision LLM abstraction
- [ ] `fdad892` feat(B9): implement Azure Vision LLM provider
- [ ] `99e9db9` feat(C7): implement ImageCaptioner
- [ ] `b000ed3` feat(C8): implement DenseEncoder
- [ ] `7ed749e` feat(C9): implement SparseEncoder
- [ ] `f98fbb5` feat(C10): implement BatchProcessor

### 阶段三：数据摄取管道-存储层

- [ ] `3d8bcb6` feat(C11): implement BM25Indexer
- [ ] `905aa1a` feat(c12): implement VectorUpserter
- [ ] `41f7f09` feat(C13): implement ImageStorage
- [ ] `d305bad` feat(C14): Implement Ingestion Pipeline
- [ ] `66f23ef` feat(C15): Add ingest.py CLI script

## 学习笔记

### 2025-xx-xx

今天学习了...

### 遇到的问题

1. 问题描述...
   解决方案...
