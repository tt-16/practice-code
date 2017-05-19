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

// WebBrowserView.cpp : CWebBrowserView 类的实现
//

#include "stdafx.h"
#include "WebBrowserApplication.h"

#include "WebBrowserApplicationDoc.h"
#include "WebBrowserView.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CWebBrowserView

IMPLEMENT_DYNCREATE(CWebBrowserView, CHtmlView)

BEGIN_MESSAGE_MAP(CWebBrowserView, CHtmlView)
	// 标准打印命令
	ON_COMMAND(ID_FILE_PRINT, &CHtmlView::OnFilePrint)
END_MESSAGE_MAP()

// CWebBrowserView 构造/析构

CWebBrowserView::CWebBrowserView()
{
	// TODO: 在此处添加构造代码

}

CWebBrowserView::~CWebBrowserView()
{
}

BOOL CWebBrowserView::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: 在此处通过修改
	//  CREATESTRUCT cs 来修改窗口类或样式

	return CHtmlView::PreCreateWindow(cs);
}

void CWebBrowserView::OnInitialUpdate()
{
	CHtmlView::OnInitialUpdate();

	Navigate2(_T("file:///C:/WebBrowserApplication/HtmlData/echarts.html"),NULL,NULL);
}


// CWebBrowserView 打印


void CWebBrowserView::OnFilePrintPreview()
{
	AFXPrintPreview(this);
}


void CWebBrowserView::OnRButtonUp(UINT nFlags, CPoint point)
{
	ClientToScreen(&point);
	OnContextMenu(this, point);
}

void CWebBrowserView::OnContextMenu(CWnd* pWnd, CPoint point)
{
	theApp.GetContextMenuManager()->ShowPopupMenu(IDR_POPUP_EDIT, point.x, point.y, this, TRUE);
}


// CWebBrowserView 诊断

#ifdef _DEBUG
void CWebBrowserView::AssertValid() const
{
	CHtmlView::AssertValid();
}

void CWebBrowserView::Dump(CDumpContext& dc) const
{
	CHtmlView::Dump(dc);
}

CWebBrowserApplicationDoc* CWebBrowserView::GetDocument() const // 非调试版本是内联的
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CWebBrowserApplicationDoc)));
	return (CWebBrowserApplicationDoc*)m_pDocument;
}
#endif //_DEBUG


// CWebBrowserView 消息处理程序
