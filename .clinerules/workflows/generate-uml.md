---
description: "Cline (AI 助手) 用於從文檔、圖片等資料產生 UML 圖表的工作流程，支援 PlantUML 和 Mermaid 格式，包含 sequence、activity、state、class diagram 等。"
author: "Cline Team"
version: "1.0"
tags: ["uml", "plantuml", "mermaid", "diagram", "documentation", "sequence", "activity", "state", "class"]
globs: ["source/**/*", "*.md", "*.txt", "*.png", "*.jpg", "*.jpeg", "*.pdf"]
---

# UML 圖表生成 Workflow

您有權限使用終端命令和檔案讀取工具。請協助我從 source/{feature} 資料夾的內容產生 UML 圖表，包含 PlantUML 和 Mermaid 格式。

<detailed_sequence_of_steps>

# UML 圖表生成流程 - 詳細步驟

## 1. 收集需求資訊

1. 詢問使用者要處理的功能特徵：

    ```xml
    <ask_followup_question>
    <question>請提供以下資訊：
    1. 要處理的功能特徵名稱（對應 source/{feature} 資料夾）
    2. 希望產生哪些類型的 UML 圖表（sequence、activity、state、class diagram 等）
    3. 是否有特定的圖表重點或要求？
    4. 偏好 PlantUML 還是 Mermaid 格式？</question>
    <options>["提供功能特徵名稱", "讓我先說明需求", "查看可用的功能特徵"]</options>
    </ask_followup_question>
    ```

## 2. 探索 source 資料夾結構

1. 檢查 source 資料夾的結構：

    ```bash
    # 列出 source 資料夾下的所有功能特徵
    ls -la source/
    ```

2. 檢查特定功能特徵的資料夾內容：

    ```bash
    # 列出指定功能特徵資料夾的內容
    ls -la source/{feature}/
    ```

3. 使用檔案讀取工具檢查文檔內容：

    ```xml
    <read_file>
    <path>source/{feature}/</path>
    </read_file>
    ```

## 3. 分析資料內容

1. 識別和分類資料：

    ```xml
    <ask_followup_question>
    <question>我在 source/{feature} 資料夾中發現以下內容：
    
    [列出發現的檔案和資料類型]
    
    基於這些資料，我建議產生以下 UML 圖表：
    - [建議的圖表類型]
    - [建議的圖表類型]
    - [建議的圖表類型]
    
    您同意這些建議嗎？或者有其他特定的圖表需求？</question>
    <options>["同意建議", "修改建議", "讓我先查看資料內容", "有其他需求"]</options>
    </ask_followup_question>
    ```

2. 分析文檔內容以提取 UML 元素：

    ```xml
    <read_file>
    <path>source/{feature}/*.md</path>
    </read_file>
    ```

    ```xml
    <read_file>
    <path>source/{feature}/*.txt</path>
    </read_file>
    ```

## 4. 產生 UML 圖表

### 4.1 Sequence Diagram（時序圖）

1. 分析流程和互動：

    ```xml
    <ask_followup_question>
    <question>基於分析，我識別出以下參與者和互動：
    
    [列出參與者]
    [列出主要互動流程]
    
    這是否正確？需要調整哪些部分？</question>
    <options>["正確", "需要調整參與者", "需要調整流程", "有其他問題"]</options>
    </ask_followup_question>
    ```

2. 產生 PlantUML Sequence Diagram：

    ```plantuml
    @startuml
    title {feature} 時序圖
    
    participant User as 使用者
    participant System as 系統
    participant Database as 資料庫
    
    User -> System: 請求操作
    System -> Database: 查詢資料
    Database --> System: 返回結果
    System --> User: 回應結果
    
    @enduml
    ```

3. 產生 Mermaid Sequence Diagram：

    ```mermaid
    sequenceDiagram
        participant User as 使用者
        participant System as 系統
        participant Database as 資料庫
        
        User->>System: 請求操作
        System->>Database: 查詢資料
        Database-->>System: 返回結果
        System-->>User: 回應結果
    ```

### 4.2 Activity Diagram（活動圖）

1. 分析業務流程：

    ```xml
    <ask_followup_question>
    <question>我識別出以下業務流程步驟：
    
    [列出流程步驟]
    
    這些步驟的順序和決策點是否正確？</question>
    <options>["正確", "需要調整步驟", "需要調整順序", "遺漏了某些步驟"]</options>
    </ask_followup_question>
    ```

2. 產生 PlantUML Activity Diagram：

    ```plantuml
    @startuml
    title {feature} 活動圖
    
    start
    :開始操作;
    if (條件檢查?) then (是)
        :執行操作A;
    else (否)
        :執行操作B;
    endif
    :完成處理;
    stop
    
    @enduml
    ```

3. 產生 Mermaid Activity Diagram：

    ```mermaid
    graph TD
        A[開始操作] --> B{條件檢查?}
        B -->|是| C[執行操作A]
        B -->|否| D[執行操作B]
        C --> E[完成處理]
        D --> E
        E --> F[結束]
    ```

### 4.3 State Diagram（狀態圖）

1. 分析狀態轉換：

    ```xml
    <ask_followup_question>
    <question>我識別出以下狀態和轉換：
    
    狀態：
    [列出狀態]
    
    轉換：
    [列出狀態轉換]
    
    這些狀態和轉換是否完整？</question>
    <options>["完整", "需要添加狀態", "需要調整轉換", "有其他問題"]</options>
    </ask_followup_question>
    ```

2. 產生 PlantUML State Diagram：

    ```plantuml
    @startuml
    title {feature} 狀態圖
    
    [*] --> 初始狀態
    初始狀態 --> 處理中 : 開始處理
    處理中 --> 完成 : 處理成功
    處理中 --> 錯誤 : 處理失敗
    完成 --> [*]
    錯誤 --> [*]
    
    @enduml
    ```

3. 產生 Mermaid State Diagram：

    ```mermaid
    stateDiagram-v2
        [*] --> 初始狀態
        初始狀態 --> 處理中 : 開始處理
        處理中 --> 完成 : 處理成功
        處理中 --> 錯誤 : 處理失敗
        完成 --> [*]
        錯誤 --> [*]
    ```

### 4.4 Class Diagram（類別圖）

1. 分析類別結構：

    ```xml
    <ask_followup_question>
    <question>我識別出以下類別和關係：
    
    類別：
    [列出類別]
    
    關係：
    [列出類別關係]
    
    這些類別和關係是否正確？</question>
    <options>["正確", "需要添加類別", "需要調整關係", "有其他問題"]</options>
    </ask_followup_question>
    ```

2. 產生 PlantUML Class Diagram：

    ```plantuml
    @startuml
    title {feature} 類別圖
    
    class User {
        -id: String
        -name: String
        +login()
        +logout()
    }
    
    class System {
        -config: Config
        +process()
        +validate()
    }
    
    User --> System : 使用
    
    @enduml
    ```

3. 產生 Mermaid Class Diagram：

    ```mermaid
    classDiagram
        class User {
            -String id
            -String name
            +login()
            +logout()
        }
        
        class System {
            -Config config
            +process()
            +validate()
        }
        
        User --> System : 使用
    ```

## 5. 驗證和調整

1. 詢問使用者對產生的圖表是否滿意：

    ```xml
    <ask_followup_question>
    <question>我已經產生了以下 UML 圖表：
    
    [列出產生的圖表]
    
    這些圖表是否符合您的需求？需要進行哪些調整？</question>
    <options>["滿意，不需要調整", "需要調整某些圖表", "需要添加其他圖表", "需要重新分析資料"]</options>
    </ask_followup_question>
    ```

2. 根據反饋進行調整：

    ```xml
    <ask_followup_question>
    <question>請告訴我具體需要調整哪些部分：
    1. 哪些圖表需要修改？
    2. 需要調整哪些元素？
    3. 是否需要添加新的圖表類型？</question>
    <options>["調整圖表內容", "添加新圖表", "修改格式", "重新開始"]</options>
    </ask_followup_question>
    ```

## 6. 輸出結果

1. 提供最終的 UML 圖表：

    ```xml
    <ask_followup_question>
    <question>最終的 UML 圖表已經完成！包含：
    
    [列出所有最終圖表]
    
    您希望我：
    1. 將這些圖表保存到檔案？
    2. 提供圖表的說明文檔？
    3. 生成圖表的預覽？</question>
    <options>["保存到檔案", "生成說明文檔", "生成預覽", "全部都要"]</options>
    </ask_followup_question>
    ```

2. 保存圖表到檔案：

    ```bash
    # 創建輸出目錄結構
    mkdir -p target/{feature}/plantUML
    mkdir -p target/{feature}/mermaid
    
    # 保存 PlantUML 檔案到 target/{feature}/plantUML/
    echo "@startuml..." > target/{feature}/plantUML/sequence.puml
    echo "@startuml..." > target/{feature}/plantUML/activity.puml
    echo "@startuml..." > target/{feature}/plantUML/state.puml
    echo "@startuml..." > target/{feature}/plantUML/class.puml
    
    # 保存 Mermaid 檔案到 target/{feature}/mermaid/
    echo "sequenceDiagram..." > target/{feature}/mermaid/sequence.mmd
    echo "graph TD..." > target/{feature}/mermaid/activity.mmd
    echo "stateDiagram-v2..." > target/{feature}/mermaid/state.mmd
    echo "classDiagram..." > target/{feature}/mermaid/class.mmd
    ```

## 7. 總結和後續步驟

1. 提供使用建議：

    ```
    ✅ UML 圖表生成完成！
    
    產生的圖表：
    - [圖表類型] (PlantUML & Mermaid)
    - [圖表類型] (PlantUML & Mermaid)
    - [圖表類型] (PlantUML & Mermaid)
    - [圖表類型] (PlantUML & Mermaid)
    
    檔案位置：
    - PlantUML 檔案：target/{feature}/plantUML/
    - Mermaid 檔案：target/{feature}/mermaid/
    
    後續建議：
    1. 使用 PlantUML 工具渲染 target/{feature}/plantUML/ 中的 .puml 檔案
    2. 使用 Mermaid 工具渲染 target/{feature}/mermaid/ 中的 .mmd 檔案
    3. 將圖表整合到文檔中
    4. 定期更新圖表以反映系統變更
    ```

2. 詢問是否需要其他協助：

    ```xml
    <ask_followup_question>
    <question>您還需要其他協助嗎？例如：
    1. 解釋如何渲染這些圖表？
    2. 幫助整合圖表到文檔中？
    3. 為其他功能特徵產生圖表？
    4. 修改現有的圖表？</question>
    <options>["解釋渲染方法", "整合到文檔", "處理其他特徵", "修改圖表", "不需要其他協助"]</options>
    </ask_followup_question>
    ```

## 故障排除

### 常見問題

1. **資料夾不存在**
   - 檢查 source 資料夾是否存在
   - 確認功能特徵名稱是否正確

2. **資料內容不足**
   - 詢問使用者是否需要提供更多資料
   - 建議添加更多文檔或圖片

3. **圖表不準確**
   - 重新分析資料內容
   - 詢問使用者具體的業務邏輯

4. **格式問題**
   - 檢查 PlantUML 和 Mermaid 語法
   - 提供語法修正建議

### 支援

如果遇到問題，請：
1. 檢查資料夾結構和內容
2. 確認功能特徵名稱
3. 提供更多相關資料
4. 說明具體的業務需求

## 更新日誌

### v1.0
- 初始版本
- 支援 PlantUML 和 Mermaid 格式
- 包含 sequence、activity、state、class diagram
- 自動分析 source/{feature} 資料夾內容
- 互動式調整和驗證流程 