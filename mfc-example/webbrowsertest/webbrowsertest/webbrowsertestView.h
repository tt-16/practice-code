// 这段 MFC 示例源代码演示如何使用 MFC Microsoft Office Fluent 用户界面 
// ("Fluent UI")，该示例仅作为参考资料提供， 
// 用以补充《Microsoft 基础类参考》和 
// MFC C++ 库软件随附的相关电子文档。
// 复制、使用或分发 Fluent UI 的许可条款是单独提供的。
// 若要了解有关 Fluent UI 许可计划的详细信息，请访问  
// http://msdn.microsoft.com/officeui。
//
// 版权所有 (C) Microsoft Corporation
// 保留所有权利。

// webbrowsertestView.h : CwebbrowsertestView 类的接口
//


#pragma once


class CwebbrowsertestView : public CHtmlView
{
protected: // 仅从序列化创建
	CwebbrowsertestView();
	DECLARE_DYNCREATE(CwebbrowsertestView)

// 属性
public:
	CwebbrowsertestDoc* GetDocument() const;

// 操作
public:

// 重写
public:
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
protected:
	virtual void OnInitialUpdate(); // 构造后第一次调用

// 实现
public:
	virtual ~CwebbrowsertestView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// 生成的消息映射函数
protected:
	afx_msg void OnFilePrintPreview();
	afx_msg void OnRButtonUp(UINT nFlags, CPoint point);
	afx_msg void OnContextMenu(CWnd* pWnd, CPoint point);
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // webbrowsertestView.cpp 中的调试版本
inline CwebbrowsertestDoc* CwebbrowsertestView::GetDocument() const
   { return reinterpret_cast<CwebbrowsertestDoc*>(m_pDocument); }
#endif

