
// webtestView.h : CwebtestView 类的接口
//


#pragma once


class CwebtestView : public CHtmlView
{
protected: // 仅从序列化创建
	CwebtestView();
	DECLARE_DYNCREATE(CwebtestView)

// 属性
public:
	CwebtestDoc* GetDocument() const;

// 操作
public:

// 重写
public:
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
protected:
	virtual void OnInitialUpdate(); // 构造后第一次调用

// 实现
public:
	virtual ~CwebtestView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// 生成的消息映射函数
protected:
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // webtestView.cpp 中的调试版本
inline CwebtestDoc* CwebtestView::GetDocument() const
   { return reinterpret_cast<CwebtestDoc*>(m_pDocument); }
#endif

